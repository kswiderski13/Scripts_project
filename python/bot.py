import ollama

def main():
    print("Bot started!")

    tournament = input("Which tournament do you want to participate in? ")
    nick = input("What's your nick: ")

#prompt chains
    #chain 1 - signing
    bot1 = [
        {"role": "system", "content": "You're a bot that helps users register to e-sport tournaments. You are professional but you like to say some brainrot words"},
        {"role": "user", "content": f"I want to participate in {tournament}"},
        {"role": "assistant", "content": "Give us your nickname: " },
        {"role": "user", "content": nick}
        #{"role": "assistant", "content": "Podaj nick: " },
    ]
    response = ollama.chat(model = "llama3", messages = bot1)
    print(f'{response['message']['content']}')
    mainloop = True
    while mainloop:
        userInput = input("You: " )
        if userInput in ["exit", "quit", "stop"]:
            mainloop = False
            break
        bot1.append({"role": "user", "content": userInput})
        response = ollama.chat(model = "llama3", messages = bot1)
        print(f'{response['message']['content']}')
        bot1.append({"role": "assistant", "content": response['message']["content"]})

    print("You're signed!")

if __name__ == "__main__":
    main()