# тестовый проект на flutter

-При запуске отображается экран авторизации, необходимо ввести логин и пароль. Если кредиты совпадают с логином "test" и паролем "test", переход на главный экран (MainFrame).
Если введенные логин и пароль неверны, отображается сообщение об ошибке.

-На главном экране (MainFrame) происходит загрузка данных с удаленного сервера. Для этого используется пакет http, который выполняет GET-запрос к адресу "https://jsonplaceholder.typicode.com/posts". Полученные данные представляют собой список элементов.

-Каждый элемент списка (Items) содержит заголовок (title), идентификатор пользователя (userId), идентификатор элемента (id) и содержимое (body).

-При нажатии на элемент списка происходит анимация масштабирования элемента.

-При смахивании элемента влево или вправо отображается фоновое цветное поле с надписью "Delete". При выполнении смахивания элемента происходит его удаление из списка (только локально, без запросов на удаление)
