
&НаСервере
Функция ВыполнитьФоновоеЗаданиеНаСервере(ПараметрыЗапуска, УникальныйИдентификатор)
	
	НаименованиеЗадания = "Массовое Создание Актов";

	ВыполняемыйМетод = "Обработка.ВКМ_МассовоеСозданиеАктов.МодульОбъекта.ЗаполнитьНаСервере";
	
	ПараметрыВыполнения 	= ДлительныеОперации.ПараметрыВыполненияВФоне(УникальныйИдентификатор);
	ПараметрыВыполнения.НаименованиеФоновогоЗадания = НаименованиеЗадания;
	ПараметрыВыполнения.ЗапуститьВФоне 	= Истина;
	ПараметрыВыполнения.Вставить("ИдентификаторФормы", УникальныйИдентификатор); 
	
	СтруктураФоновогоЗадания = ДлительныеОперации.ВыполнитьВФоне(ВыполняемыйМетод, ПараметрыЗапуска, ПараметрыВыполнения);
	
	Возврат СтруктураФоновогоЗадания;
	
	
	
КонецФункции

&НаКлиенте
Процедура Заполнить(Команда)
	
	ИДЗадания = "";
	Индикатор = 0;
	СтрокаСостояния = "";
	
	ПараметрыЗапуска = Новый Структура;
	ПараметрыЗапуска.Вставить("Период", Объект.Период);
	ПараметрыЗапуска.Вставить("Объект", Объект);

	СтруктураФоновогоЗадания = ВыполнитьФоновоеЗаданиеНаСервере(ПараметрыЗапуска, УникальныйИдентификатор);
	ИДЗадания 	= СтруктураФоновогоЗадания.ИдентификаторЗадания;
	
	ПараметрыОжидания  = ДлительныеОперацииКлиент.ПараметрыОжидания(ЭтотОбъект);
	ПараметрыОжидания.ВыводитьПрогрессВыполнения = Истина;
	ПараметрыОжидания.Интервал  = 2;
	
	ДлительныеОперацииКлиент.ОжидатьЗавершение(СтруктураФоновогоЗадания, Новый ОписаниеОповещения("ОбработатьДанные", ЭтотОбъект), ПараметрыОжидания);
	
	ЗаполнитьОбработкуАктамиЗаПериод();
	
КонецПроцедуры 


&НаКлиенте
Процедура ОбработатьДанные(Результат, ДополнительныеПараметры) Экспорт

	ОтключитьОбработчикОжидания("ОбработчикОжиданияИндикатор");
	
	Если Результат = Неопределено Тогда
		Возврат;
	ИначеЕсли Результат.Статус = "Ошибка" Тогда
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(Результат.ПодробноеПредставлениеОшибки);
		ЭтаФорма.СтрокаСостояния = "Ошибка";
	ИначеЕсли Результат.Статус = "Выполнено" Тогда
		ЭтаФорма.Индикатор = 100;
		ЭтаФорма.СтрокаСостояния = "Выполнено";
		Текст = ПолучитьИзВременногоХранилища(Результат.АдресРезультата);
		Сообщить(Текст);
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьОбработкуАктамиЗаПериод()
	
		НачалоПериода = НачалоМесяца(Дата(Объект.Период));
	КонецПериода = КонецМесяца(Дата(Объект.Период));
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	РеализацияТоваровУслуг.Договор КАК Договор,
	               |	РеализацияТоваровУслуг.Ссылка КАК Ссылка,
	               |	РеализацияТоваровУслуг.Договор.Ссылка КАК ДоговорСсылка,
	               |	РеализацияТоваровУслуг.Договор.Наименование КАК ДоговорНаименование
	               |ИЗ
	               |	Документ.РеализацияТоваровУслуг КАК РеализацияТоваровУслуг
	               |ГДЕ
	               |	РеализацияТоваровУслуг.Дата МЕЖДУ &НачалоПериода И &КонецПериода
	               |	И РеализацияТоваровУслуг.Договор.ВидДоговора = &ВидДоговора";
	
	Запрос.УстановитьПараметр("ВидДоговора", ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание"));
	Запрос.УстановитьПараметр("НачалоПериода", НачалоПериода);
	Запрос.УстановитьПараметр("КонецПериода", КонецПериода);

	Выборка = Запрос.Выполнить().Выбрать();
	
	Объект.ДокументыЗаПериод.Очистить();

	Пока Выборка.Следующий() Цикл
	тчДокументы = Объект.ДокументыЗаПериод.Добавить();
	тчДокументы.Договор = Выборка.Договор;
	тчДокументы.ДокументРеализация = Выборка.Ссылка;
	
	КонецЦикла;
	
	
КонецПроцедуры

