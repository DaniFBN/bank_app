Nome, telefone, cpf, data de nascimento
address

email, senha,

tipo do cartao

---

M - Model(Dart)
V - Page
W - Whatever(Reatividade/Gerencia de estado)
Feedback
R - Repository
Mexer com meios externos(fora da aplicação), ex, localStorage, Bluetooth, GPS, API
S - Service
Abstrair pacotes e não depender deles - Reduzir o acoplamento

Page
Reatividade
Consumo de meios externos
Service
Model(Entity, Model)

Page
Model?
Gerencia de estado
Service - LocalStorage

Flutterando
ResoCoder



domain -> Regra de negócio
infra -> Tratar o que vem e o que vai
external -> Acessa os dados(Service[API, Bluetooth, LocalStorage])
presenter -> Tela e Gerencia de estado

service -> abstração

CasoDeUso(Domain)
  PersonRepository(Infra)
    PersonDatasource(External)
      HttpService(Core)
