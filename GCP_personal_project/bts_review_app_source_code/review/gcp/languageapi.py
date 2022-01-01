from google.cloud import language_v1

lang_client = language_v1.LanguageServiceClient()

"""
Returns sentiment analysis score
- create document from passed text
- do sentiment analysis using natural language applicable
- return the sentiment score
"""
def analyze(text):

    doc = language_v1.types.Document(content=text,
                    type_='PLAIN_TEXT')
    sentiment = lang_client.analyze_sentiment(
                    document=doc).document_sentiment
    return sentiment.score
