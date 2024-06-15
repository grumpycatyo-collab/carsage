import auth
def generate_plan_anthropic():
    client = auth.connect_to_anthropic()

    query = f''' Tell me smoking is bad for my health.'''
    
    message = client.messages.create(
        model='claude-3-haiku-20240307',
        max_tokens=1000,
        temperature=0.0,
        messages=[{"role": "user", "content": query}]
    )
    response = message.content[0].text

    return response
 
    
