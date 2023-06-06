# ChatGPT AI flutter App 
An AI Chatbot application created using the Flutter framework, Open API and relay [server](https://github.com/SakhnevichKirill/FlutterChatGptRelayServer)


Мультиплатформенное приложение, позволяющее пользоваться ChatGPT без ограничений и VPN.

## Функционал

- [x] Передача запроса с помощью API ChatGPT
- [x] Получение потока ответа 
- [x] Общение клиент-сервиса с помощью сокетов
- [x] Адаптивный дизайн под разные платформы

## Возможности пользователя

* Создание нового чата
* Регенерация последнего ответа от ChatGPT
* Вопросы ChatGPT версии 3.5 и получение ответа в контексте диалога
* В дальнейшем мы планируем добавить возможность разных промптов пользователем, таких как доктор, комик, создатель промптов, тренер и многих других.

## Технологии

* Rust
* Flutter
* BLoC
* Docker
* Gradle

## Зависимости
Для установления зависимостей выполните:
```
> flutter pub get
```

## Запуск клиента
```
> flutter run
```
## Ссылки

* [Библиотека подключения к API ChatGPT на Rust](https://github.com/Maxuss/chatgpt_rs/blob/master/examples/streamed_conversation.rs)
* [Пример приложения на Flutter](https://github.com/wewehao/flutter_chatgpt/blob/main/lib/page/ChatPage.dart)
* [Промпты](https://habr.com/ru/articles/528116/)


