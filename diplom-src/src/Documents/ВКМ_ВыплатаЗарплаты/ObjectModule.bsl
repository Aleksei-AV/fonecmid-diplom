#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ, Режим)
	
	Движения.ВКМ_ВзаиморасчетыССотрудниками.Записывать = Истина;
	Для Каждого ТекСтрокаВыплата Из Выплаты Цикл
		Движение = Движения.ВКМ_ВзаиморасчетыССотрудниками.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Сотрудник = ТекСтрокаВыплата.Сотрудник;
		Движение.Сумма = ТекСтрокаВыплата.СуммаКВыплате;
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

