
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура СписокПриАктивизацииСтроки(Элемент)
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Элементы.Список);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Элементы.Список);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Элементы.Список);
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
	
	Оповестить("Запись_ВКМ_ОбслуживаниеКлиента", , Объект.Ссылка);
	
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	
	Текст = "Создан новый документ";
	ЗаписатьУведомленияТелеграмБоту(ТекущийОбъект, Текст);
	
КонецПроцедуры

Процедура ЗаписатьУведомленияТелеграмБоту(ТекущийОбъект, Текст)

		НачатьТранзакцию();
	
	Попытка
		
		ОбъектУведомлениеТГ = Справочники.ВКМ_УведомленияТелеграмБоту.СоздатьЭлемент();
		ОбъектУведомлениеТГ.Наименование = ТекущийОбъект;
		ОбъектУведомлениеТГ.Текст = Текст;
		
		ОбъектУведомлениеТГ.Записать();
		
		
		// чтение или запись данных
		//ДокументОбъект.Записать()
		ЗафиксироватьТранзакцию();
		
		
	Исключение
		ОтменитьТранзакцию();
		// дополнительные действия по обработке исключения
		
		
		
	КонецПопытки;

	
	
КонецПроцедуры


&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	
	//ДатаПроведенияРаботСтарая = Ссылка.ДатаПроведенияРабот;
	//ВремяНачалаРаботПланСтарая = Ссылка.ВремяНачалаРаботПлан;
	//ВремяОкончанияРаботПланСтарая = Ссылка.ВремяОкончанияРаботПлан;
	//
	//Если ДатаПроведенияРаботСтарая <> ДатаПроведенияРабот Тогда 
	//	Текст = "Дата работ по документу изменена";
	//	ЗаписатьУведомленияТелеграмБоту(Ссылка.Документ, Текст);
	//КонецЕсли;
	//
	//Если ВремяНачалаРаботПланСтарая <> ВремяНачалаРаботПлан Тогда 
	//	Текст = "Время начала работ по документу изменено";
	//	ЗаписатьУведомленияТелеграмБоту(Ссылка.Документ, Текст);
	//КонецЕсли;
	//
	//Если ВремяОкончанияРаботПланСтарая <> ВремяОкончанияРаботПлан Тогда 
	//	Текст = "Время окончания работ по документу изменено";
	//	ЗаписатьУведомленияТелеграмБоту(Ссылка.Документ, Текст);
	//КонецЕсли;
	
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
