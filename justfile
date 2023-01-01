# to use cmd.exe instead of sh run `just --shell powershell.exe --shell-arg -c`


build-wasm PKL_FILE TEMP_GO_FILE OUTPUT_WASM:
  python -c "import m2cgen as m2c;import pickle;model=pickle.load(open('{{PKL_FILE}}','rb'));f=open('{{TEMP_GO_FILE}}','w');f.write('package main\n\n');f.write(m2c.export_to_go(model))"
  tinygo build -o {{OUTPUT_WASM}} -target=wasi -wasm-abi=generic model2wasm.go {{TEMP_GO_FILE}}
  rm {{TEMP_GO_FILE}}
  rm {{PKL_FILE}}
  
generate-wasm-examples:
  python -c "score=open('demo/generated_m2cgen_code_examples/classification/decision_tree.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/classification/decision_tree.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/classification/lightgbm.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/classification/lightgbm.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/classification/linear.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/classification/linear.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/classification/random_forest.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/classification/random_forest.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/classification/svm.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/classification/svm.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/classification/xgboost.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/classification/xgboost.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/regression/decision_tree.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/regression/decision_tree.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/regression/lightgbm.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/regression/lightgbm.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/regression/linear.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/regression/linear.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/regression/random_forest.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/regression/random_forest.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/regression/svm.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/regression/svm.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go
  python -c "score=open('demo/generated_m2cgen_code_examples/regression/xgboost.go','r').read();f=open('temp.go','w');f.write('package main\n\n'+score)"
  tinygo build -o generated_wasm_examples/regression/xgboost.wasm -target=wasi -wasm-abi=generic model2wasm.go temp.go