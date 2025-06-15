import discord
from discord.ext import commands
import ollama

TOKEN = 'MTM4Mzg2ODMxNjM3NTk3MzkxOA.GP08f1.VTgNU07FIGZf8QABA3EKWKoIl8K4CUiZqNQAHo'

intents = discord.Intents.default()
intents.message_content = True

bot = commands.Bot(command_prefix='!', intents=intents)

user_chats = {}

@bot.event
async def on_ready():
    print(f'Zalogowano jako {bot.user}')

#first chain
@bot.command()
async def signup(ctx, tournament):
    user_id = str(ctx.author.id)
    user_chats[user_id] = [
        {"role": "system", "content": "You're a bot that helps users register to e-sport tournaments. You are professional but you like to say some brainrot words"},
        {"role": "user", "content": f"I want to participate in {tournament}"}
    ]
    response = ollama.chat(model="llama3", messages=user_chats[user_id])
    user_chats[user_id].append({"role": "assistant", "content": response['message']['content']})
    await ctx.send(response['message']['content'])

#bot loop allowing conversation
@bot.event
async def on_message(message):
    if message.author == bot.user:
        return
    user_id = str(message.author.id)
    if user_id in user_chats and message.content.startswith('!') is False:
        user_chats[user_id].append({"role": "user", "content": message.content})
        response = ollama.chat(model="llama3", messages=user_chats[user_id])
        user_chats[user_id].append({"role": "assistant", "content": response['message']['content']})
        await message.channel.send(response['message']['content'])
    await bot.process_commands(message)

#second chain
@bot.command()
async def info(ctx, player):
    chat = [
        {"role": "system", "content": "You're a bot that provides e-sport tournament participants info about their opponents. You are professional but you like to say some brainrot words"},
        {"role": "user", "content": f"I want to check player {player}"}
    ]
    response = ollama.chat(model="llama3", messages=chat)
    await ctx.send(response['message']['content'])

#third chain
@bot.command()
async def results(ctx, player):
    chat = [
        {"role": "system", "content": "You're a bot that provides e-sport tournament participants info about their opponents results. You are professional but you like to say some brainrot words"},
        {"role": "user", "content": f"Show me the results of player {player}"}
    ]
    response = ollama.chat(model="llama3", messages=chat)
    await ctx.send(response['message']['content'])

bot.run(TOKEN)