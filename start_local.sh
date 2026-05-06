#!/bin/bash
# ════════════════════════════════════════════════════════════════════
# GNOS RAG Bot - Local Development Startup (Linux/macOS)
# ════════════════════════════════════════════════════════════════════

echo ""
echo "Installing dependencies..."
pip install -r requirements.txt

echo ""
echo "Creating .env file if it doesn't exist..."
if [ ! -f ".env" ]; then
    cp .env.template .env
    echo "✓ Created .env file (edit with your API keys)"
else
    echo "✓ .env already exists"
fi

echo ""
echo "Starting RAG Bot API server..."
echo ""
echo "API Server: http://localhost:8000"
echo "Docs:       http://localhost:8000/docs"
echo "Health:     http://localhost:8000/health"
echo "Test POST:  http://localhost:8000/ask"
echo ""
echo "Ctrl+C to stop server"
echo ""

python -m uvicorn api:app --reload --host 127.0.0.1 --port 8000
