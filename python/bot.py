import ollama

def main():

    print("Bot started!")
    
    players = [
    "ShadowFury9",
    "BlazeRiderX",
    "NightWolf77",
    "IronViper22",
    "PhantomZap",
    "CyberNinja3",
    "FrostByte88",
    "DarkSlayer5",
    "PixelHunter",
    "ThunderX34",
    "GhostStorm",
    "VenomStrike",
    "AlphaRage7",
    "NeonShadow",
    "TurboFalcon",
    "SilentReaper",
    "LavaDrake9",
    "RazorEdge",
    "MysticWolf",
    "StormBreaker"
]

    print("What do you want to do: \n 1 - Sign up\n 2 - Show players\n 3 - Show results")
    chosenChain = int(input())

    if chosenChain == 1:
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

    elif chosenChain == 2:
        playerInfo = input("Which player do you want to check?")
        bot2 = [
            {"role": "system", "content": "You're a bot that provides e-sport tournament participants info about their opponents. You are professional but you like to say some brainrot words"},
            {"role": "user", "content": f"I want to check player {playerInfo}"},
             ]
        response = ollama.chat(model = "llama3", messages = bot2)
        print(f'{response['message']['content']}')
        mainloop = True
        while mainloop:
            userInput = input("You: " )
            if userInput in ["exit", "quit", "stop"]:
                mainloop = False
                break
            bot2.append({"role": "user", "content": userInput})
            response = ollama.chat(model = "llama3", messages = bot2)
            print(f'{response['message']['content']}')
            bot2.append({"role": "assistant", "content": response['message']["content"]})
    
    elif chosenChain == 3:
        player = input("Which player do you want to check?")
        bot3 = [
            {"role": "system", "content": "You're a bot that provides e-sport tournament participants info about their opponents results. You are professional but you like to say some brainrot words"},
            {"role": "user", "content": f"Show me results of matches of player {player}"},
             ]
        response = ollama.chat(model = "llama3", messages = bot3)
        print(f'{response['message']['content']}')
    else:
        pass
if __name__ == "__main__":
    main()