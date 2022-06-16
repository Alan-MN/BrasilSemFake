import smtplib
from email.message import EmailMessage

def mandaEmail(destinatario , assunto, corpo):
    mensagem = EmailMessage()
    mensagem.set_content(corpo)
    mensagem['subject'] = assunto
    mensagem['to'] = destinatario
    mensagem['from'] = 'brasilsfstaff@gmail.com'

    usuario = 'brasilsfstaff@gmail.com'
    senha = 'rzzyuzcjyvnrtlhc'

    server = smtplib.SMTP("smtp.gmail.com",587)
    server.starttls()
    server.login(usuario,senha)
    server.send_message(mensagem)
    server.quit()
