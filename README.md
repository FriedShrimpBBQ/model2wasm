# Model to WASM

Convert a Python model to WASM object through the power of Python and Go.

## Installation

To install, we need to install m2cgen. It is probably best to use a virtual environment such as `venv` to not pollute the global `python` setup, via something like `python -m venv venv;venv/Scripts/activate;`

```sh
pip install m2cgen
```

You will need to install the appropriate depedencies along with `m2cgen` depending on your model choice, e.g. `pip install m2cgen scikit-learn`

Also make sure you have [Go](https://golang.google.cn/) and [TinyGo](https://tinygo.org/) installed. Optionally you may want to install [just](https://github.com/casey/just) and [wasmer](https://wasmer.io/)

## Usage

The rough workflow is:

1. Generate the model (in Go) via m2cgen
2. Generate the Go code
3. Generate the TinyGo compatible code for WASM build
4. Build the WASM file

It would look something like the below (has some missing arguments, check `justfile` for details:

```sh
$ m2cgen mymodel.pkl --language go > model2tinygo.go
$ go run model2tinygo.go > main.go
$ tinygo build -o output.wasm -target=wasi -wasm-abi=generic main.go
$ wasmer output.wasm -- 1 2 -2 -1
```

This has been abstracted away via [just](https://github.com/casey/just) where you can run

```sh
just -l
just build-wasm mymodel.pkl mymodel.go mymodel.wasm
# in windows
just --shell powershell.exe --shell-arg -c build-wasm mymodel.pkl mymodel.go mymodel.wasm
```

Reproducible example:

```sh
python demo/generate_model_example.py --filename mymodel
just build-wasm mymodel.pkl mymodel.go mymodel.wasm
wasmer mymodel.wasm -- 1 2 -2 -1
# output - 199
```