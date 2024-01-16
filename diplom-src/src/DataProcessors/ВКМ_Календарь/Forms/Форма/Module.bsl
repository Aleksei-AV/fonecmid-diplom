
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	НачалоПериода = НачалоНедели(ТекущаяДатаСеанса());
	КонецПериода = КонецНедели(ТекущаяДатаСеанса());
	
	Планировщик.ТекущиеПериодыОтображения.Добавить(НачалоПериода, КонецПериода);
	
	ОбслуживаниеКлиентов = Документы.ВКМ_ОбслуживаниеКлиента.Выбрать(НачалоПериода, КонецПериода);
	
	ОбновитьПланировщикНаСервере();
	
КонецПроцедуры

&НаСервере
Процедура ОбновитьПланировщикНаСервере()
	
	НачалоПериода = НачалоНедели(ТекущаяДатаСеанса());
	КонецПериода = КонецНедели(ТекущаяДатаСеанса());
	
	Планировщик.Элементы.Очистить();
	
	ОбслуживаниеКлиентов = Документы.ВКМ_ОбслуживаниеКлиента.Выбрать(НачалоПериода, КонецПериода);
	
	Пока ОбслуживаниеКлиентов.Следующий() Цикл
		
		УсловнаяПродолжительность = (ОбслуживаниеКлиентов.ВремяОкончанияРаботПлан - ОбслуживаниеКлиентов.ВремяНачалаРаботПлан);
		Время = ОбслуживаниеКлиентов.ВремяНачалаРаботПлан - Дата(1, 1, 1) ;
		НачалоОбслуживание = ОбслуживаниеКлиентов.ДатаПроведенияРабот + Время;
		КонецОбслуживание = НачалоОбслуживание + УсловнаяПродолжительность;
		
		ЭлементПланировщика = Планировщик.Элементы.Добавить(НачалоОбслуживание, КонецОбслуживание);
		ЭлементПланировщика.Значение = ОбслуживаниеКлиентов.Ссылка;
		ШаблонПланировщика = СтрШаблон("Документ № %1, организация %2, исполнитель %3", ОбслуживаниеКлиентов.Номер, ОбслуживаниеКлиентов.Клиент, ОбслуживаниеКлиентов.Специалист);
		ЭлементПланировщика.Текст = ШаблонПланировщика;
		
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьКалендарь(Команда)
	
	ОбновитьПланировщикНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура ПланировщикПередСозданием(Элемент, Начало, Конец, ЗначенияИзмерений, Текст, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ЗначенияЗаполнения = Новый Структура;
	ЗначенияЗаполнения.Вставить("ДатаПроведенияРабот", Дата(Начало));
	ЗначенияЗаполнения.Вставить("ВремяНачалаРаботПлан", Дата(Начало));
	ЗначенияЗаполнения.Вставить("ВремяОкончанияРаботПлан", Дата(Конец));
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ЗначенияЗаполнения", ЗначенияЗаполнения);
	
	ОткрытьФорму("Документ.ВКМ_ОбслуживаниеКлиента.ФормаОбъекта", ПараметрыФормы);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
	Если ИмяСобытия = "Запись_ВКМ_ОбслуживаниеКлиента" Тогда
		
		ОбновитьПланировщикНаСервере(); 
		
	КонецЕсли;
	
КонецПроцедуры



