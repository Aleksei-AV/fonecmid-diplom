
Процедура ОбработкаПроведения(Отказ, Режим)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	ДоговорыКонтрагентов.Ссылка КАК Ссылка,
	               |	ДоговорыКонтрагентов.Наименование КАК Наименование,
	               |	ДоговорыКонтрагентов.ВидДоговора КАК ВидДоговора,
	               |	ДоговорыКонтрагентов.ВКМ_ДатаНачалаДействияДоговора КАК ВКМ_ДатаНачалаДействияДоговора,
	               |	ДоговорыКонтрагентов.ВКМ_ДатаОкончанияДействияДоговора КАК ВКМ_ДатаОкончанияДействияДоговора,
	               |	ДоговорыКонтрагентов.ВКМ_СуммаАбонентскойПлаты КАК ВКМ_СуммаАбонентскойПлаты,
	               |	ДоговорыКонтрагентов.ВКМ_СтоимостьЧасаРаботы КАК ВКМ_СтоимостьЧасаРаботы
	               |ИЗ
	               |	Справочник.ДоговорыКонтрагентов КАК ДоговорыКонтрагентов
	               |ГДЕ
	               |	ДоговорыКонтрагентов.Ссылка = &Договор";
	
	Запрос.УстановитьПараметр("Договор", Договор);
	
	Выборка = Запрос.Выполнить().Выбрать();
	
	Пока Выборка.Следующий() Цикл 
		
		Если ДатаПроведенияРабот >= Выборка.ВКМ_ДатаНачалаДействияДоговора 
			И ДатаПроведенияРабот <= Выборка.ВКМ_ДатаОкончанияДействияДоговора Тогда
			
			Движения.ВКМ_ВыполненныеКлиентуРаботы.Записывать = Истина;
			
			Для Каждого ТекСтрокаВыполненныеРаботы Из ВыполненныеРаботы Цикл
				Движение = Движения.ВКМ_ВыполненныеКлиентуРаботы.Добавить();
				Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
				Движение.Период = Дата;
				Движение.Клиент = Клиент;
				Движение.Договор = Договор;
				Движение.КоличествоЧасов = ТекСтрокаВыполненныеРаботы.ЧасыКОплатеКлиенту;
				Движение.СуммаКОплате = ТекСтрокаВыполненныеРаботы.ЧасыКОплатеКлиенту * Выборка.ВКМ_СтоимостьЧасаРаботы;
			КонецЦикла;
			
		Иначе
			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = "Период действия договора не соответствует дате проведения работ";
			Сообщение.Сообщить();
			
			Отказ = Истина;
			
		КонецЕсли;
		
	КонецЦикла;
	
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ	
	
КонецПроцедуры


