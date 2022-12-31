import glob



for file in glob.glob("classification/*.go"):
  file = file.replace('\\', '/')
  print(f"""  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/{file} -output-name temp.go
  tinygo build -o generated_wasm_examples/{file[:-3]+'.wasm'} -target=wasi -wasm-abi=generic temp.go""")

for file in glob.glob("regression/*.go"):
  file = file.replace('\\', '/')
  print(f"""  go run model2tinygo.go -input-name demo/generated_m2cgen_code_examples/{file} -output-name temp.go
  tinygo build -o generated_wasm_examples/{file[:-3]+'.wasm'} -target=wasi -wasm-abi=generic temp.go""")