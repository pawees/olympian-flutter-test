
## Что сделать:
Обосновать свое решение в текстовом виде, положительные и отрицательные моменты реализации на ваш взгляд. Закоммитить в корневой Readme.
Изучив задание я выделил такую сущность как подсказки.От этого отталкивается мое решение.
Provider для управлением состоянием. Легкий доступ из любого места в дереве виджетов. Управление сосредоточено в одном месте HintViewModel.
Использовал виджет-обертку 'HelperLotiieAnimation' для более удобного управлением анимации при использовании в дереве.
Использовал Selector для предотвращения лишних перестроений,так же HintViewModel имеет возможность добавления моделей данных.
Все это позволит расширять и модифицировать логику управления подсказками.
Для удобства контроля над анимациями создал mixin PlayAnimationMixin.

Из минусов: 
    Потенциальная возможность избыточного перестроения виджетов. 
    Сейчас чтобы получить стейт каждая анимация обращается к бд,что не очень хорошо,если их будет много.


## Дополнительное задание (опционально):
Сформулиромать в текстовом виде 3 предложения по рефакторингу чтобы вы хотели изменить в приложении, и обоснование почему считаете что это необходимо сделать. Закоммитить в Readme.
1. Я бы добавил поддержку множества репозиториев. Так репозиторий взял бы ответсвенность за доступ к данным, локальным и сети,кеширование.
С помощью репозиториев можно реализовать взаимодействие между ViewModel, они могли бы подписываться на изменения в репозиториях.
2. Я бы модифицировал управление навигацией, описал бы эндпоинты для более ясного управления. Добавил поддержку deepLink
3. Разделил бы старт приложения с конфигурациями для dev и prod и test. Это позволило бы не смешивать окружения и защитить данные

