class ProcessText:
    count_vectorizer = {}
    loaded_model = {}

    def __init__(self, count_vectorizer, loaded_model):
        self.count_vectorizer = count_vectorizer
        self.loaded_model = loaded_model

    def check_validity(self, text: str) -> str:
        text_array = [text]
        test_counts = self.count_vectorizer.transform(text_array)

        return str(self.loaded_model.predict(test_counts)[0])
