# GNOS RAG Bot - Deployment Guide

## Quick Start

### 1. Local Development (Testing)

#### Windows
```bash
start_local.bat
```

#### Linux/macOS
```bash
chmod +x start_local.sh
./start_local.sh
```

**Expected Output:**
```
API Server: http://localhost:8000
Docs:       http://localhost:8000/docs
Health:     http://localhost:8000/health
```

### 2. Test Local API
```bash
# Test health
curl http://localhost:8000/health

# Test /ask endpoint
curl -X POST http://localhost:8000/ask \
  -H "Content-Type: application/json" \
  -d '{"query": "What is GNOS?"}'

# Or use Python test script
python test_api.py --url http://localhost:8000
```

---

## Deployment Options

### Option A: HuggingFace Spaces (Recommended - Free)

#### Setup
1. Go to: https://huggingface.co/spaces
2. Click **"Create New Space"**
   - Name: `gnos-rag-bot`
   - License: `openrail`
   - Space SDK: **Python**
   - Space hardware: **CPU Basic** (free)

3. Upload this repo:
   ```bash
   git clone https://huggingface.co/spaces/YOUR_USERNAME/gnos-rag-bot
   cd gnos-rag-bot
   git remote add github https://github.com/thisasg-dev/Grama-Niladari-Online-Service-GNOS-
   git fetch github main
   git merge github/main -m "Merge Flask app"
   git push
   ```

4. Set Environment Variables
   - Go to Space **Settings** → **Repository secrets**
   - Add these keys:
     - `GEMINI_API_KEY_1` = Your Gemini key from https://aistudio.google.com/app/apikeys
     - `GROQ_API_KEY_1` = Your Groq key from https://console.groq.com
     - `HF_TOKEN` (optional)

5. Create `Dockerfile` (HF Spaces uses this)
   ```dockerfile
   FROM python:3.11-slim
   WORKDIR /app
   COPY requirements.txt .
   RUN pip install --no-cache-dir -r requirements.txt
   COPY . .
   CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "7860"]
   ```

6. Space auto-deploys and becomes available at:
   ```
   https://YOUR_USERNAME-gnos-rag-bot.hf.space/
   ```

---

### Option B: Render.com (Free tier available)

#### Setup
1. Go to: https://render.com
2. Connect GitHub repository
3. Create **New Web Service**
   - Repository: `Grama-Niladari-Online-Service-GNOS-`
   - Branch: `main`
   - Runtime: `Python 3`
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `uvicorn api:app --host 0.0.0.0 --port $PORT`

4. Set Environment Variables
   - Dashboard → Environment
   - Add `GEMINI_API_KEY_1`, `GROQ_API_KEY_1`, etc.

5. Deploy button → Auto-deploys on push
6. Available at: `https://gnos-rag-bot.onrender.com/`

---

### Option C: Railway (Fast, $5 credits free)

#### Setup
1. Go to: https://railway.app
2. Login with GitHub
3. **New Project** → Import repo
4. Add environment variables for API keys
5. Deploy → Available at auto-generated URL

---

### Option D: Docker (Local or Own Server)

#### Build and Run
```bash
# Build image
docker build -t gnos-rag-bot .

# Run container
docker run -p 8000:8000 \
  -e GEMINI_API_KEY_1="your_key" \
  -e GROQ_API_KEY_1="your_key" \
  gnos-rag-bot

# Push to Docker Hub
docker tag gnos-rag-bot YOUR_USERNAME/gnos-rag-bot
docker push YOUR_USERNAME/gnos-rag-bot
```

---

## API Endpoints

### Health Check
```bash
GET /health
```
Response:
```json
{
  "status": "ok",
  "service": "GNOS RAG Bot"
}
```

### Ask Question
```bash
POST /ask
Content-Type: application/json

{
  "query": "Your question here"
}
```

Response:
```json
{
  "answer": "Bot's answer"
}
```

---

## Environment Variables Required

| Variable | Source | Required | Notes |
|----------|--------|----------|-------|
| `GEMINI_API_KEY_1` | https://aistudio.google.com/app/apikeys | ✅ Yes | Primary LLM, 1M tokens/day free |
| `GEMINI_API_KEY_2` | https://aistudio.google.com/app/apikeys | ❌ Optional | Fallback Gemini key |
| `GROQ_API_KEY_1` | https://console.groq.com | ✅ Yes | Fallback LLM, 100k tokens/day free |
| `GROQ_API_KEY_2` | https://console.groq.com | ❌ Optional | Additional Groq key |
| `GROQ_API_KEY_3` | https://console.groq.com | ❌ Optional | Additional Groq key |
| `HF_TOKEN` | https://huggingface.co/settings/tokens | ❌ Optional | For HF model/dataset access |

---

## Troubleshooting

### 404 Error on `/ask`
**Cause:** Endpoint not found  
**Fix:** Check that you're calling `/ask` not `/api/predict`

### 400 Bad Request
**Cause:** Missing or wrong JSON format  
**Fix:** Send `{"query": "text"}` not `{"data": ["text"]}`

### 429 Rate Limit
**Cause:** API key quota exceeded  
**Fix:** Use multiple API keys (rotate them)

### Timeout (>30s)
**Cause:** LLM taking too long  
**Fix:** Check backend logs, ensure keys are valid

### CORS Error in Flutter
**Cause:** Missing CORS headers  
**Fix:** Backend has CORS middleware enabled (fixed in v6.0)

---

## Testing & Debugging

### Use Test Script
```bash
# Local
python test_api.py

# Remote (HF Spaces)
python test_api.py --remote

# Custom question
python test_api.py --question "What is GNOS?"
```

### Manual cURL Tests
```bash
# Health check
curl -X GET http://localhost:8000/health

# Ask question
curl -X POST http://localhost:8000/ask \
  -H "Content-Type: application/json" \
  -d '{"query":"What is GNOS?"}'

# Test remote
curl -X GET https://sanketh2002-gnos-rag-bot.hf.space/health
```

### View Backend Logs
- **HF Spaces:** Settings → Logs
- **Render:** Dashboard → Logs
- **Local:** Terminal output

---

## Production Checklist

- [ ] API keys configured in environment variables
- [ ] Health endpoint responding: `GET /health` → 200
- [ ] Ask endpoint working: `POST /ask` → 200
- [ ] CORS headers present
- [ ] Error handling working
- [ ] Response time < 30 seconds
- [ ] Backend URL updated in Flutter app ([lib/rag.dart](lib/rag.dart#L51))
- [ ] Test with sample questions
- [ ] Monitor API usage and rate limits

---

## Current Deployment

**Status:** Ready for deployment  
**Backend URL:** `https://sanketh2002-gnos-rag-bot.hf.space/`  
**Flutter Integration:** Updated to call `/ask` with correct format

---

## Quick Links

- 🔗 [Google Gemini API](https://aistudio.google.com/app/apikeys)
- 🔗 [Groq API Keys](https://console.groq.com)
- 🔗 [HuggingFace Spaces](https://huggingface.co/spaces)
- 🔗 [Render.com](https://render.com)
- 🔗 [Railway.app](https://railway.app)
- 🔗 [Docker Hub](https://hub.docker.com)
