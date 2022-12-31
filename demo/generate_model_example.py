import argparse
import pickle

from sklearn.datasets import load_diabetes
from sklearn.tree import DecisionTreeRegressor


def main(filename):
    X, y = load_diabetes(return_X_y=True)
    model = DecisionTreeRegressor()
    model.fit(X[:, :4], y)  # take 4 features

    with open(f"{filename}.pkl", "wb") as f:
        f.write(pickle.dumps(model))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--filename", default="mymodel")
    args = parser.parse_args()
    main(args.filename)
