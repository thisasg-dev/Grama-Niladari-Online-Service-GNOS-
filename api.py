from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from rag_bot import rag_pipeline
import traceback

app = FastAPI()

# Add CORS middleware for mobile app access
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class Question(BaseModel):
    query: str


# Health check endpoint
@app.get("/health")
def health():
    return {"status": "ok", "service": "GNOS RAG Bot"}


@app.post("/ask")
def ask(q: Question):
    try:
        question = q.query
        
        if not question or question.strip() == "":
            return {"answer": "Please ask a valid question."}
        
        answer = rag_pipeline(question)
        
        return {"answer": answer}
    except Exception as e:
        error_msg = f"Error processing question: {str(e)}"
        print(f"Backend Error: {traceback.format_exc()}")
        return {"answer": "Sorry, an error occurred processing your question. Please try again.", "error": error_msg}