# Инструкция по начальной настройке

## В конфигурацию добавлены:

1 Константы:
-1.1	ВКМ_ТокенУправленияТелеграмБотом (Токен управления телеграм ботом). Токен телеграм бота для отправки информационных сообщений в телеграм канал. Заполняет Администратор. Размещен «Добавленные объекты – Сервис». 
-1.2	ВКМ_ИдентификаторГруппыДляОповещения (Идентификатор группы для оповещения). Идентификатор телеграм канала для информационных сообщений. Заполняет Администратор. Размещен «Добавленные объекты – Сервис».
-1.3	ВКМ_НоменклатураАбонентскаяПлата (Номенклатура абонентская плата). Используется для автоматического заполнения документов реализации по контрагентам с абонентской платой. Заполняет Администратор (Абонентская плата). Размещен «Добавленные объекты – Сервис».
-1.4	ВКМ_НоменклатураРаботыСпециалиста (Номенклатура работы специалиста). Используется для автоматического заполнения документов реализации по контрагентам у которых в периоде были проведены работы. Заполняет Администратор (Работа специалиста). Размещен «Добавленные объекты – Сервис».

2	Справочники:
-2.1	ВКМ_УведомленияТелеграмБоту. Справочник формирует информацию по сообщениям для отправки в телеграм канал. 
-2.2	ВКМ_ОбслуживаниеКлиентаПрисоединенныеФайлы. Справочник для прхранения присоединенных файлов для документа «ВКМ_ОбслуживаниеКлиента» (Обслуживание клиента).
-2.3	ВКМ_ГрафикиРаботы. Содержит графики работы (Пятидневка, Шесидневка, и т.д.)
-2.4	ВКМ_Подразделения. Содержит подразделения для сотрудников (Административный персонал, Специалисты). Используется для автоматического заполнения документа «Начисление заработной платы».
-2.5	ВКМ_ФизическиеЛица. Содержит сотрудников с назначенными подразделениями.

3	Документы:
-3.1	ВКМ_ОбслуживаниеКлиента;
-3.2	ВКМ_НачислениеЗарплаты;
-3.3	ВКМ_НачислениеФиксированнойПремии;
-3.4	ВКМ_ВыплатаЗарплаты;
-3.5	ВКМ_ГрафикОтпусков.

4	Роли:
-4.1	ВКМ_ПодсистемаДобавленныеОбъекты;
-4.2	ВКМ_ДобавлениеИзменениеОбслуживаниеКлиента;
-4.3	ВКМ_ИспользованиеОбработкиКалендарь;
-4.4	ВКМ_ИспользованиеОбработкиМассовоеСозданиеАктов;
-4.5	ВКМ_ДобавлениеИзменениеНачисленияЗарплаты;
-4.6	ВКМ_ДобавлениеИзменениеГрафиковОтпусков;
-4.7	ВКМ_ДобавлениеИзменениеНачисленияФиксированнойПремии;
-4.8	ВКМ_ДобавлениеИзменениеВыплатыЗарплаты;
-4.9	ВКМ_РаботаСОтчетомАнализВыставленныхАктов;
-4.10	ВКМ_РаботаСОтчетомРасчетыССотрудниками;
-4.11	ВКМ_РаботаСОтчетомВыработкаСпециалистов;
-4.12	ВКМ_РаботаСОтчетомРасходЗапланированныхОтпусков.

## Первоначальное наполнение базы.

1.	Администратор заполняется константы (Добавленные объекты – Сервис): Токен управления телеграм ботом, Идентификатор группы для оповещения, Номенклатура абонентская плата, Номенклатура работы специалиста.
2.	Администратор создает профили групп доступа (Администрирование – Настройка пользователей и прав – Профили групп доступа):
-а. «Специалист» и подключает добавленные роли - ВКМ добавление изменение обслуживание клиента, ВКМ подсистема добавленные объекты, ВКМ работа с отчетом выработка специалистов.
-б. «Менеджер» и подключает добавленные роли - ВКМ добавление изменение обслуживание клиента, ВКМ использование обработки календарь, ВКМ подсистема добавленные объекты.
-в. «БухгалтерИТФирмы» и подключает добавленные роли - ВКМ использование обработки массовое создание актов, ВКМ подсистема добавленные объекты, ВКМ работа с отчетом анализ выставленных актов.
-г. «КадровикРасчетчик» и подключает добавленные роли - ВКМ добавление изменение выплаты зарплаты, ВКМ добавление изменение графиков отпусков, ВКМ добавление изменение начисления зарплаты, ВКМ добавление изменение начисления фиксированной премии, ВКМ подсистема добавленные объекты, ВКМ работа с отчетом выработка специалистов, ВКМ работа с отчетом расход запланированных отпусков, ВКМ работа с отчетом расчеты с сотрудниками.

3.	Кадровик-расчетчик заполняет справочники: Подразделения, Физические лица, Графики работы.
4.	Кадровик-расчетчик заполняет регистр Графики работы используя обработку для заполнения «Заполнение графика работы» и заполнив соответствующие поля.
5.	Кадровик-расчетчик заполняет регистр Условия оплаты сотрудников.



