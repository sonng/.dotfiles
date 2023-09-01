function ask --wraps='ollama run llama2:13b-chat-q5_K_M' --description 'alias ask=ollama run phind-codellama'
  ollama run phind-codellama $argv
end
