## Системное программирование
-------------
# Лабораторная работа 1. LINUX, DOCKER, BASH, ОКРУЖЕНИЕ ДЛЯ РАЗРАБОТКИ

# Цель работы
Целью лабораторной работы является ознакомление с операционной системой и основными командами ОС Unix/Linux, возможностями Docker для контейнеризации окружения программного обеспечения и его зависимостей, средств разработки и сборки ПО. Необходимо подготовить Dockerfile, в котором осуществляется виртуализация операционной системы и устанавливаются необходимые пакеты.

# Вариант

Вариант задания образ ОС для Docker - Amazon Linux

Необходимо разработать скрипт, который:

- выводит список настроенных репозиториев с указанием подключенных
- запрашивает у пользователя имя репозитория из списка
- если указанный репозиторий подключен, то отключает его
- если указанный репозиторий отключен, то подключает его

Для выполнения задания используйте команду yum.
