
Процедура ОбработкаПроведения(Отказ, Режим)
	
	АбонентскоеОбслуживание = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание");
	ПериодДействияДоговора = Ссылка.Договор.ВКМ_ДатаНачалаДействияДоговора <= Ссылка.ДатаПроведенияРабот 
							И Ссылка.Договор.ВКМ_ДатаОкончанияДействияДоговора >= Ссылка.ДатаПроведенияРабот;
							
	Если Ссылка.Договор.ВидДоговора <> АбонентскоеОбслуживание Тогда 
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Вид договора не соответствует";
		Сообщение.Сообщить();
		
	КонецЕсли;
		
	Если ПериодДействияДоговора = Ложь Тогда
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Период действия договора не соответствует дате проведения работ";
		Сообщение.Сообщить();
		
	КонецЕсли;
	
	Если Ссылка.Договор.ВидДоговора = АбонентскоеОбслуживание И ПериодДействияДоговора = Истина 
		И ЗначениеЗаполнено(Ссылка.ВыполненныеРаботы) Тогда 
		
		Движения.ВКМ_ВыполненныеКлиентуРаботы.Записывать = Истина;
		Движения.ВКМ_ВыполненныеКлиентуРаботы.Записать();
		
		Запрос = Новый Запрос;
		Запрос.Текст = "ВЫБРАТЬ
		               |	ВКМ_ОбслуживаниеКлиента.Ссылка КАК Ссылка,
		               |	ВКМ_ОбслуживаниеКлиента.Клиент КАК Клиент,
		               |	ВКМ_ОбслуживаниеКлиента.Договор КАК Договор,
		               |	ВКМ_ОбслуживаниеКлиентаВыполненныеРаботы.ЧасыКОплатеКлиенту КАК ЧасыКОплатеКлиенту,
		               |	ДоговорыКонтрагентов.ВКМ_СуммаАбонентскойПлаты КАК СуммаАбонентскойПлаты,
		               |	ДоговорыКонтрагентов.ВКМ_СтоимостьЧасаРаботы КАК СтоимостьЧасаРаботы,
		               |	ВКМ_ОбслуживаниеКлиента.ДатаПроведенияРабот КАК ДатаПроведенияРабот,
		               |	ВКМ_УсловияОплатыСотрудников.ПроцентОтРабот КАК ПроцентОтРабот
		               |ИЗ
		               |	Документ.ВКМ_ОбслуживаниеКлиента.ВыполненныеРаботы КАК ВКМ_ОбслуживаниеКлиентаВыполненныеРаботы
		               |		ЛЕВОЕ СОЕДИНЕНИЕ Документ.ВКМ_ОбслуживаниеКлиента КАК ВКМ_ОбслуживаниеКлиента
		               |			ЛЕВОЕ СОЕДИНЕНИЕ Справочник.ДоговорыКонтрагентов КАК ДоговорыКонтрагентов
		               |			ПО ВКМ_ОбслуживаниеКлиента.Договор = ДоговорыКонтрагентов.Ссылка
		               |			ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.ВКМ_УсловияОплатыСотрудников КАК ВКМ_УсловияОплатыСотрудников
		               |			ПО ВКМ_ОбслуживаниеКлиента.Специалист = ВКМ_УсловияОплатыСотрудников.Сотрудник
		               |		ПО ВКМ_ОбслуживаниеКлиентаВыполненныеРаботы.Ссылка = ВКМ_ОбслуживаниеКлиента.Ссылка
		               |ГДЕ
		               |	ВКМ_ОбслуживаниеКлиента.Ссылка = &Ссылка";
		
		Запрос.УстановитьПараметр("Ссылка", Ссылка);
		
		Выборка= Запрос.Выполнить().Выбрать();
		
		Движения.ВКМ_ВыполненныеКлиентуРаботы.Записывать = Истина;
		Движения.ВКМ_ВыполненныеСотрудникомРаботы.Записывать = Истина;
		
		Пока Выборка.Следующий() Цикл
			// регистр ВКМ_ВыполненныеКлиентуРаботы Приход	
			Движение = Движения.ВКМ_ВыполненныеКлиентуРаботы.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
			Движение.Период = Дата;
			Движение.Клиент = Выборка.Клиент;
			Движение.Договор = Выборка.Договор;
			Движение.КоличествоЧасов = Выборка.ЧасыКОплатеКлиенту;
			Движение.СуммаКОплате = Выборка.ЧасыКОплатеКлиенту * Выборка.СтоимостьЧасаРаботы;
			
			// регистр ВКМ_ВыполненныеСотрудникомРаботы Расход
			Движение = Движения.ВКМ_ВыполненныеСотрудникомРаботы.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
			Движение.Период = Дата;
			Движение.Сотрудник = Специалист;
			Движение.ЧасовКОплате = Выборка.ЧасыКОплатеКлиенту;
			Движение.СуммаКОплате = Выборка.ЧасыКОплатеКлиенту * Выборка.СтоимостьЧасаРаботы * Выборка.ПроцентОтРабот / 100;
			
		КонецЦикла;
		
		Движения.ВКМ_ВыполненныеСотрудникомРаботы.Записать();
		Движения.ВКМ_ВыполненныеКлиентуРаботы.Записать(); 

	КонецЕсли;
	
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Если НЕ ЭтоНовый() Тогда
		
		Запрос = Новый Запрос; 
		Запрос.Текст = "ВЫБРАТЬ
		               |	ВКМ_ОбслуживаниеКлиента.ДатаПроведенияРабот КАК ДатаПроведенияРабот,
		               |	ВКМ_ОбслуживаниеКлиента.ВремяНачалаРаботПлан КАК ВремяНачалаРаботПлан,
		               |	ВКМ_ОбслуживаниеКлиента.Специалист КАК Специалист
		               |ИЗ
		               |	Документ.ВКМ_ОбслуживаниеКлиента КАК ВКМ_ОбслуживаниеКлиента
		               |ГДЕ
		               |	ВКМ_ОбслуживаниеКлиента.Ссылка = &Ссылка"; 
		
		Запрос.УстановитьПараметр("Ссылка", ЭтотОбъект.Ссылка); //ЭтотОбъект
		
		Выборка = Запрос.Выполнить().Выбрать();
		Выборка.Следующий();
		
		Если Выборка.ДатаПроведенияРабот <> ДатаПроведенияРабот Тогда 
			НоваяДата = ДатаПроведенияРабот;
			ШаблонДата = "дата начала" + " " + Формат(НоваяДата, "ДФ=dd.MM.yyyy");
		КонецЕсли;
		
		Если Выборка.ВремяНачалаРаботПлан <> ВремяНачалаРаботПлан Тогда 
			НовоеВремяНачала = ВремяНачалаРаботПлан;
			ШаблонВремяНачало = "время начала" + " " + Формат(НовоеВремяНачала, "ДФ=HH:mm");
		КонецЕсли;
		
		Если Выборка.Специалист <> Специалист Тогда 
			НовыйИсполнитель = Специалист;
			ШаблонИсполнитель = "исполнитель" + " " + НовыйИсполнитель;
		КонецЕсли;
		
		Если ЗначениеЗаполнено(НоваяДата) Или ЗначениеЗаполнено(НовоеВремяНачала) Или ЗначениеЗаполнено(НовыйИсполнитель) Тогда
			
			ОбъектУведомлениеТГ = Справочники.ВКМ_УведомленияТелеграмБоту.СоздатьЭлемент();
			ШаблонНаименование = "По документу № %1";
			ОбъектУведомлениеТГ.Наименование = СтрШаблон(ШаблонНаименование, Номер);
			ШаблонСообщения = "Внесены изменения: %1 %2 %3";
			ОбъектУведомлениеТГ.Текст = СтрШаблон(ШаблонСообщения, ШаблонДата, ШаблонВремяНачало, ШаблонИсполнитель);
			
			ОбъектУведомлениеТГ.Записать();
		КонецЕсли;
		
		
	КонецЕсли;
	
КонецПроцедуры




