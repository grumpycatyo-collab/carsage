import anthropic
import logging as log
from dotenv import load_dotenv, find_dotenv
import os
anthropic_client = None

log.basicConfig(format='%(asctime)s %(levelname)s %(message)s', level='INFO')


def connect_to_anthropic():
    """Connect to Anthropic API and return client object.

    Returns:
        Login: The Anthropic API client.
    """
    global anthropic_client

    if anthropic_client is not None:
        return anthropic_client

    load_dotenv(find_dotenv())
    
    log.info('Connecting to Anthropic API')
    anthropic_client = anthropic.Anthropic(
        api_key = os.getenv('CAR_SAGE_CLAUDE_API')
    )
    return anthropic_client
