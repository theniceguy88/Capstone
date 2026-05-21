from fastapi import FastAPI

app = FastAPI(title="FitReward API")

@app.get("/")
def root():
    return {"message": "FitReward FastAPI placeholder"}

@app.get("/health")
def health_check():
    return {"status": "ok"}
