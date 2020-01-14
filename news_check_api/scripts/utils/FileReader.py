import pickle

import joblib


def file_reader():
    with open('models/vectorize.pkl', 'rb') as f:
        count_vectorizer = joblib.load(f)

    with open('models/model.pickle', 'rb') as f:
        loaded_model = pickle.load(f)
    return count_vectorizer, loaded_model
