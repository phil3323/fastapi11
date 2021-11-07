FROM python:3.9

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

COPY app app/

RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1xzlZoMPz8jXN7XP52rX0Q9uGSnLU2NkP' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1xzlZoMPz8jXN7XP52rX0Q9uGSnLU2NkP" -O export.pkl && rm -rf /tmp/cookies.txt

RUN ls app/

# RUN python app/server.py

EXPOSE 80

CMD ["python", "app/server.py", "serve"]