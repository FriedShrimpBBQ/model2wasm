# to use cmd.exe instead of sh run `just --shell powershell.exe --shell-arg -c`


build-wasm PKL_FILE TEMP_GO_FILE OUTPUT_WASM:
  # Powershell shenanigans...
  # m2cgen {{PKL_FILE}} --language go > {{TEMP_GO_FILE}}
  python -c "import m2cgen as m2c;import pickle;model=pickle.load(open('{{PKL_FILE}}','rb'));f=open('{{TEMP_GO_FILE}}','w');f.write(m2c.export_to_go(model))"
  go run model2tinygo.go -input-name {{TEMP_GO_FILE}} -output-name {{TEMP_GO_FILE}}
  tinygo build -o {{OUTPUT_WASM}} -target=wasi -wasm-abi=generic {{TEMP_GO_FILE}}
  rm {{TEMP_GO_FILE}}
  rm {{PKL_FILE}}
  
generate-wasm-examples:
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/classification/decision_tree.go -output-name temp.go
  tinygo build -o generated_wasm_examples/classification/decision_tree.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/classification/lightgbm.go -output-name temp.go
  tinygo build -o generated_wasm_examples/classification/lightgbm.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/classification/linear.go -output-name temp.go
  tinygo build -o generated_wasm_examples/classification/linear.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/classification/random_forest.go -output-name temp.go
  tinygo build -o generated_wasm_examples/classification/random_forest.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/classification/svm.go -output-name temp.go
  tinygo build -o generated_wasm_examples/classification/svm.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/classification/xgboost.go -output-name temp.go
  tinygo build -o generated_wasm_examples/classification/xgboost.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/regression/decision_tree.go -output-name temp.go
  tinygo build -o generated_wasm_examples/regression/decision_tree.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/regression/lightgbm.go -output-name temp.go
  tinygo build -o generated_wasm_examples/regression/lightgbm.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/regression/linear.go -output-name temp.go
  tinygo build -o generated_wasm_examples/regression/linear.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/regression/random_forest.go -output-name temp.go
  tinygo build -o generated_wasm_examples/regression/random_forest.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/regression/svm.go -output-name temp.go
  tinygo build -o generated_wasm_examples/regression/svm.wasm -target=wasi -wasm-abi=generic temp.go
  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/regression/xgboost.go -output-name temp.go
  tinygo build -o generated_wasm_examples/regression/xgboost.wasm -target=wasi -wasm-abi=generic temp.go