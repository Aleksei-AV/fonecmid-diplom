﻿
#language: ru

@tree

Функционал: Создание документа "Обслуживание клиента"

Как Менеджер я хочу
создать документ "Обслуживание клиента"
чтобы проверить работоспособность ТГ Бота

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создаю документ "Обслуживание клиента"
*Запуск клиента от имени Менеджера
	Тогда я подключаю TestClient "ТестКлиент" логин "МаринаМ" пароль ""
*Менеджер переходит к заполнению заявок
	И В командном интерфейсе я выбираю 'Добавленные объекты' 'Обслуживание клиентов'
*Создаю первый документ
	Тогда открылось окно 'Обслуживание клиентов'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Обслуживание клиента (создание)'
	И я нажимаю кнопку выбора у поля с именем "Клиент"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000003' | 'Авиатор'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Договор"
	Тогда открылось окно 'Договоры контрагентов'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
	И в поле с именем 'ДатаПроведенияРабот' я ввожу текст '23.01.2024'
	И в поле с именем 'ВремяНачалаРаботПлан' я ввожу текст '15:00'
	И в поле с именем 'ВремяОкончанияРаботПлан' я ввожу текст '18:00'
	И я нажимаю кнопку выбора у поля с именем "Специалист"
	Тогда открылось окно 'Физические лица'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'ФИО'                  |
	| '000000004' | 'Сергей Специалист' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Обслуживание клиента (создание) *' в течение 20 секунд

*Создаю второй документ
	Тогда открылось окно 'Обслуживание клиентов'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Обслуживание клиента (создание)'
	И я нажимаю кнопку выбора у поля с именем "Клиент"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000004' | 'МетаКом'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Договор"
	Тогда открылось окно 'Договоры контрагентов'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
	И в поле с именем 'ДатаПроведенияРабот' я ввожу текст '22.01.2024'
	И в поле с именем 'ВремяНачалаРаботПлан' я ввожу текст '10:00'
	И в поле с именем 'ВремяОкончанияРаботПлан' я ввожу текст '13:00'
	И я нажимаю кнопку выбора у поля с именем "Специалист"
	Тогда открылось окно 'Физические лица'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'ФИО'                  |
	| '000000005' | 'Станислав Специалист' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Обслуживание клиента (создание) *' в течение 20 секунд

*Создаю третий документ
	Тогда открылось окно 'Обслуживание клиентов'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Обслуживание клиента (создание)'
	И я нажимаю кнопку выбора у поля с именем "Клиент"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000005' | 'КофеТайм'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Договор"
	Тогда открылось окно 'Договоры контрагентов'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
	И в поле с именем 'ДатаПроведенияРабот' я ввожу текст '22.01.2024'
	И в поле с именем 'ВремяНачалаРаботПлан' я ввожу текст '14:00'
	И в поле с именем 'ВремяОкончанияРаботПлан' я ввожу текст '17:00'
	И я нажимаю кнопку выбора у поля с именем "Специалист"
	Тогда открылось окно 'Физические лица'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'ФИО'                  |
	| '000000004' | 'Сергей Специалист' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Обслуживание клиента (создание) *' в течение 20 секунд

*Создаю четвертый документ
	Тогда открылось окно 'Обслуживание клиентов'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Обслуживание клиента (создание)'
	И я нажимаю кнопку выбора у поля с именем "Клиент"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000001' | 'Агрострой'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Договор"
	Тогда открылось окно 'Договоры контрагентов'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
	И в поле с именем 'ДатаПроведенияРабот' я ввожу текст '23.01.2024'
	И в поле с именем 'ВремяНачалаРаботПлан' я ввожу текст '14:00'
	И в поле с именем 'ВремяОкончанияРаботПлан' я ввожу текст '17:00'
	И я нажимаю кнопку выбора у поля с именем "Специалист"
	Тогда открылось окно 'Физические лица'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'ФИО'                  |
	| '000000004' | 'Сергей Специалист' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Обслуживание клиента (создание) *' в течение 20 секунд

*Создаю пятый документ
	Тогда открылось окно 'Обслуживание клиентов'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Обслуживание клиента (создание)'
	И я нажимаю кнопку выбора у поля с именем "Клиент"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000002' | 'ПримТорг'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Договор"
	Тогда открылось окно 'Договоры контрагентов'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
	И в поле с именем 'ДатаПроведенияРабот' я ввожу текст '23.01.2024'
	И в поле с именем 'ВремяНачалаРаботПлан' я ввожу текст '14:00'
	И в поле с именем 'ВремяОкончанияРаботПлан' я ввожу текст '17:00'
	И я нажимаю кнопку выбора у поля с именем "Специалист"
	Тогда открылось окно 'Физические лица'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'ФИО'                  |
	| '000000005' | 'Станислав Специалист' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Обслуживание клиента (создание) *'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Обслуживание клиента (создание) *' в течение 20 секунд
*Завершение сеанса от имени Менеджера
	И я закрываю TestClient "ТестКлиент"