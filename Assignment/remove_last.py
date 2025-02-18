def delete_last_element(data):
    if isinstance(data, list) and data:
        data.pop()
    elif isinstance(data, dict) and data:
        data.pop(next(reversed(data)))
    return data
