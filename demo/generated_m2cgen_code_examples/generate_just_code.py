import glob



for file in glob.glob("classification/*.go"):
  file = file.replace('\\', '/')
  print(f"""  python -c "score=open('demo/generated_m2cgen_code_examples/{file}','r').read();f=open('temp.go','w');f.write('package main\\n\\n'+score)"
  tinygo build -o generated_wasm_examples/{file[:-3]+'.wasm'} -target=wasi -wasm-abi=generic model2wasm.go temp.go""")

for file in glob.glob("regression/*.go"):
  file = file.replace('\\', '/')
  print(f"""  python -c "score=open('demo/generated_m2cgen_code_examples/{file}','r').read();f=open('temp.go','w');f.write('package main\\n\\n'+score)"
  tinygo build -o generated_wasm_examples/{file[:-3]+'.wasm'} -target=wasi -wasm-abi=generic model2wasm.go temp.go""")