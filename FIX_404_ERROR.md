# Fix 404 Error in RAG Bot - Quick Guide

## **404 Error Means:**
❌ Backend server at `https://sanketh2002-gnos-rag-bot.hf.space/ask` is **NOT RESPONDING**

---

## **Fix Steps (Choose One)**

### **Option A: Deploy/Restart HuggingFace Spaces (RECOMMENDED)**

This is the FASTEST way to fix it:

1. **Go to HF Space:**
   - https://huggingface.co/spaces/sanketh2002/gnos-rag-bot

2. **Click Settings** (top right)
   - Scroll down to **"App Status"**
   - Click **"Restart"** or **"Rebuild"** button
   - Wait 2-5 minutes

3. **Verify it's working:**
   ```bash
   # Open in browser or test with curl
   https://sanketh2002-gnos-rag-bot.hf.space/health
   
   # Should show: {"status":"ok","service":"GNOS RAG Bot"}
   ```

4. **If still 404, check Environment Variables:**
   - Click Settings → Repository secrets
   - Make sure these are set:
     - `GEMINI_API_KEY_1` (from https://aistudio.google.com/app/apikeys)
     - `GROQ_API_KEY_1` (from https://console.groq.com)
   - Click Save
   - Click Rebuild again

---

### **Option B: Test Locally First**

If Option A doesn't work, test locally:

1. **Open PowerShell in project folder**
2. **Run:**
   ```bash
   .\start_local.bat
   ```

3. **Wait for:**
   ```
   Application startup complete [press enter to quit]
   ```

4. **Update Flutter app to test locally:**
   - Edit `lib/rag.dart` line ~51
   - Change:
   ```dart
   // FROM:
   Uri.parse('https://sanketh2002-gnos-rag-bot.hf.space/ask')
   
   // TO (for local testing):
   Uri.parse('http://localhost:8000/ask')
   ```

5. **Test the app** - should work now

6. **Switch back when backend is deployed:**
   ```dart
   Uri.parse('https://sanketh2002-gnos-rag-bot.hf.space/ask')
   ```

---

### **Option C: Deploy to Render.com**

If HF Spaces keeps failing:

1. Go to: https://render.com
2. Click **New +** → **Web Service**
3. Connect your GitHub repo
4. Set Build: `pip install -r requirements.txt`
5. Set Start: `uvicorn api:app --host 0.0.0.0 --port $PORT`
6. Add environment variables (GEMINI_API_KEY_1, GROQ_API_KEY_1)
7. Deploy and update Flutter URL

---

## **Verify Backend is Working**

After deployment, test with:

```bash
# Health check (should return 200)
curl https://sanketh2002-gnos-rag-bot.hf.space/health

# Ask question (should return answer)
curl -X POST https://sanketh2002-gnos-rag-bot.hf.space/ask \
  -H "Content-Type: application/json" \
  -d '{"query":"What is GNOS?"}'

# Or use Python script
python test_api.py --remote
```

---

## **Improved Error Messages in App**

✅ The Flutter app now shows **detailed error messages**:

- **404 Error** → Shows: Backend is offline, how to fix it
- **500 Error** → Shows: Server error, check backend logs
- **422 Error** → Shows: Invalid format sent
- **503 Error** → Shows: Server temporarily down

When you get 404 in the app now, it will show:
```
❌ සර්වර් අක්‍රිය ඉහල ගිය ඉවත (404)

Backend සර්වරය ක්‍රියා නොකරයි।

✓ Backend deploy කර ඇතිද පරීක්ෂා කරන්න:
- HF Space සැකසීම් පරීක්ෂා කරන්න
- API keys එක්කර ඇතිද බලන්න
- 'Restart' හෝ 'Rebuild' ක්ලික් කරන්න
```

---

## **Common Reasons for 404**

| Problem | Solution |
|---------|----------|
| Backend not deployed | Deploy to HF Spaces, Render, or Railway |
| Backend not running | Click "Restart" in HF Space settings |
| Wrong URL in app | Check endpoint: `/ask` (not `/api/predict`) |
| API keys missing | Add GEMINI_API_KEY_1 and GROQ_API_KEY_1 |
| Rate limit hit | Wait a few minutes, use multiple keys |
| Network issue | Check internet, try VPN |

---

## **Files Updated**

✅ `lib/rag.dart` - Better error messages and debugging
✅ All changes committed to GitHub

---

## **NEXT ACTION**

**Right now, do this:**

1. Go to HF Space: https://huggingface.co/spaces/sanketh2002/gnos-rag-bot/settings
2. Click **Restart** button
3. Wait 3-5 minutes
4. Test the app → 404 should be gone!

If still seeing 404:
- Check that `GEMINI_API_KEY_1` and `GROQ_API_KEY_1` are in Repository secrets
- Click Rebuild instead of Restart
- Wait longer for deployment
