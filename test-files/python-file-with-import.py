# Sampling a dependency installed in poetry
# making sure python detects the dependency for intellicode
import sqlparse

def test_function():
    print('This is a test function')
    sqlparse.format('SELECT * FROM table', reindent=True, keyword_case='upper')
    