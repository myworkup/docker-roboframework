FROM python:3.8


RUN apt-get update && apt-get install --quiet --assume-yes python3-dev python3-pip unzip wget
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt update
RUN apt-get install -y xvfb google-chrome-stable
RUN CHROMEDRIVER_VERSION=`wget --no-verbose --output-document - https://chromedriver.storage.googleapis.com/LATEST_RELEASE`
RUN wget --no-verbose --output-document /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip
RUN unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver
RUN chmod +x /opt/chromedriver/chromedriver
RUN ln -fs /opt/chromedriver/chromedriver /usr/local/bin/chromedriver

CMD ["python3"]