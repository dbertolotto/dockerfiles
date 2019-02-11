import logging
import socket
import time

hostname = socket.gethostname()
logging.basicConfig(
        level=logging.DEBUG,
        format=('%(asctime)s - %(name)s - %(levelname)s - %(message)s'))

while True:
    logging.debug("%s: a debug log", hostname)
    logging.info("%s: an info log", hostname)
    logging.warning("%s: a warning log", hostname)
    logging.error("%s: an error log", hostname)
    time.sleep(5)
