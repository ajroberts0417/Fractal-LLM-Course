from mlc_chat import ChatModule
from mlc_chat.callback import StreamToStdout

cm = ChatModule(model="Llama-2-7b-chat-hf-q4f16_1")
cm.generate(prompt="What is the meaning of life?", progress_callback=StreamToStdout(callback_interval=2))