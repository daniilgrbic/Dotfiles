import re

# this removes unwanted suffixes often found on YT music videos

forbidden_substrings = ['topic', 'official', 'video', 'audio', 'music']
forbidden_sufixes = [' ', '-', r'\(\s*\)', r'\[\s*\]']

def clear_metadata_string(metadata_string: str):

    metadata_string = metadata_string.strip()

    while True:
        original = metadata_string
        for substring in forbidden_substrings:
            metadata_string = re.sub(substring, '', metadata_string, flags=re.I|re.A)
        if original == metadata_string:
            break

    while True:
        original = metadata_string
        for suffix in forbidden_sufixes:
            metadata_string = re.sub(suffix+'$', '', metadata_string, flags=re.I|re.A)
        if original == metadata_string:
            break

    metadata_string.replace('  ', ' ', -1)
    
    return metadata_string
