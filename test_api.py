#!/usr/bin/env python3
"""
Test script for GNOS RAG Bot API
Tests both local and remote endpoints
"""

import requests
import json
import sys
import argparse
from typing import Optional
import time

# Colors for terminal output
GREEN = "\033[92m"
RED = "\033[91m"
YELLOW = "\033[93m"
BLUE = "\033[94m"
RESET = "\033[0m"

def test_health(base_url: str) -> bool:
    """Test /health endpoint"""
    print(f"\n{BLUE}Testing health endpoint...{RESET}")
    try:
        response = requests.get(f"{base_url}/health", timeout=5)
        if response.status_code == 200:
            data = response.json()
            print(f"{GREEN}✓ Health check passed{RESET}")
            print(f"  Status: {data.get('status')}")
            print(f"  Service: {data.get('service')}")
            return True
        else:
            print(f"{RED}✗ Health check failed: {response.status_code}{RESET}")
            return False
    except Exception as e:
        print(f"{RED}✗ Health check error: {e}{RESET}")
        return False

def test_ask_endpoint(base_url: str, question: str) -> Optional[str]:
    """Test /ask endpoint with a sample question"""
    print(f"\n{BLUE}Testing /ask endpoint...{RESET}")
    print(f"  Question: {question}")
    
    payload = {"query": question}
    
    try:
        response = requests.post(
            f"{base_url}/ask",
            json=payload,
            headers={"Content-Type": "application/json"},
            timeout=60
        )
        
        print(f"  Response code: {response.status_code}")
        
        if response.status_code == 200:
            data = response.json()
            answer = data.get("answer", "")
            print(f"{GREEN}✓ Request successful{RESET}")
            print(f"  Answer length: {len(answer)} chars")
            print(f"  Answer: {answer[:200]}..." if len(answer) > 200 else f"  Answer: {answer}")
            return answer
        else:
            print(f"{RED}✗ Request failed: {response.status_code}{RESET}")
            print(f"  Response: {response.text[:500]}")
            return None
            
    except requests.Timeout:
        print(f"{RED}✗ Request timeout (>60s){RESET}")
        return None
    except Exception as e:
        print(f"{RED}✗ Request error: {e}{RESET}")
        return None

def test_endpoints(base_url: str, questions: Optional[list] = None):
    """Run all tests"""
    print(f"\n{'='*60}")
    print(f"  GNOS RAG Bot API Test Suite")
    print(f"  Base URL: {base_url}")
    print(f"{'='*60}")
    
    # Test health endpoint
    health_ok = test_health(base_url)
    if not health_ok:
        print(f"\n{YELLOW}⚠ Health check failed. API may not be running.{RESET}")
        return False
    
    # Test ask endpoint
    if questions is None:
        questions = [
            "What is GNOS?",
            "How do I get a digital ID?",
            "Explain RAG bot",
        ]
    
    print(f"\n{BLUE}Testing with {len(questions)} sample questions...{RESET}")
    
    for i, question in enumerate(questions, 1):
        print(f"\n{YELLOW}Test {i}/{len(questions)}{RESET}")
        answer = test_ask_endpoint(base_url, question)
        if answer is None:
            print(f"{RED}✗ Failed to get answer{RESET}")
            return False
        time.sleep(1)  # Rate limiting
    
    print(f"\n{'='*60}")
    print(f"{GREEN}✓ All tests passed!{RESET}")
    print(f"{'='*60}\n")
    return True

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Test GNOS RAG Bot API"
    )
    parser.add_argument(
        "--url",
        default="http://localhost:8000",
        help="Base URL of API (default: http://localhost:8000)"
    )
    parser.add_argument(
        "--remote",
        action="store_true",
        help="Test remote HuggingFace Spaces deployment"
    )
    parser.add_argument(
        "--question",
        type=str,
        help="Single question to test"
    )
    
    args = parser.parse_args()
    
    if args.remote:
        base_url = "https://sanketh2002-gnos-rag-bot.hf.space"
    else:
        base_url = args.url
    
    questions = [args.question] if args.question else None
    
    success = test_endpoints(base_url, questions)
    sys.exit(0 if success else 1)
