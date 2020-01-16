import pickle

import joblib


def load_files():
    with open('models/vectorize.pkl', 'rb') as f:
        count_vectorizer = joblib.load(f)

    with open('models/model.pickle', 'rb') as f:
        loaded_model = pickle.load(f)
    return count_vectorizer, loaded_model
