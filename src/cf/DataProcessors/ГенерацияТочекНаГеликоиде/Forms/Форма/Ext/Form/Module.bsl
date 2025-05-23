﻿// ================================= Функции для решения задачи =================================

Функция СгенерироватьСлучайноеЧислоНеймана(Минимум, Максимум)
	// Метод Неймана для генерации случайного числа
    Пока Истина Цикл
        // Генерация случайного дробного числа в диапазоне [0, 1)
        СлучайноеДробное = Математика.СлучайноеЧислоОт0До1();

        // Масштабируем число в диапазон [Минимум, Максимум]
        x = Минимум + (Максимум - Минимум) * СлучайноеДробное;

        // Генерация случайного числа y для проверки
        y = Математика.СлучайноеЧислоОт0До1();

        // Проверка условия y <= f(x)
        // В данном случае f(x) = 1 (равномерное распределение)
        Если y <= 1 Тогда
            Возврат x; // Возвращаем x как случайное число
        КонецЕсли;
	КонецЦикла;
КонецФункции

// ================================= Команды формы =================================

&НаКлиенте
Процедура СгенерироватьТочки(Команда)
	
	num_points  = 400; // Количество точек
    pi = 3.141592653589793; // Значение числа π

    Объект.Выборка.Очистить();
	
    Для i = 0 По num_points - 1 Цикл
        // Генерация случайных значений u и v методом Неймана
        u = СгенерироватьСлучайноеЧислоНеймана(0, 2 * pi);
        v = СгенерироватьСлучайноеЧислоНеймана(0, 2 * pi);

        // Вычисление координат
        НоваяСтрока = Объект.Выборка.Добавить();
        НоваяСтрока.X = u * Cos(v); // Вычисление x
        НоваяСтрока.Y = u * Sin(v); // Вычисление y
        НоваяСтрока.Z = v;		
	КонецЦикла;           
	
	Объект.Выборка.Сортировать("X");
	ОбновитьДиаграммуЭлементовНаКлиенте();
	ОбновитьДиаграммуСверхуXYНаКлиенте();
	ОбновитьДиаграммуСбокуXZНаКлиенте();
	Объект.Выборка.Сортировать("Y");
	ОбновитьДиаграммуСбокуYZНаКлиенте();
	
КонецПроцедуры




// ================================= Вывод на диаграмму =================================


&НаКлиенте
Процедура ОбновитьДиаграммуСбокуXZНаКлиенте()
    
    // Очищаем диаграмму перед построением
    ДиаграммаСбокуXZ.Очистить();
    ДиаграммаСбокуXZ.АвтоТранспонирование = Ложь;
    ДиаграммаСбокуXZ.Обновление = Ложь;
    
   
    // Создаем серии и запоминаем их
    Серия = ДиаграммаСбокуXZ.Серии.Добавить("XZ");
    
    // Добавляем точки
    Для Каждого СтрокаТЗ Из Объект.Выборка Цикл
        Точка = ДиаграммаСбокуXZ.УстановитьТочку(СтрокаТЗ.X);
        Серия = Серия;
        ДиаграммаСбокуXZ.УстановитьЗначение(Точка, Серия, СтрокаТЗ.Z);
    КонецЦикла;
  
   
    // Включаем обновление и автотранспонирование
    ДиаграммаСбокуXZ.АвтоТранспонирование = Истина;
    ДиаграммаСбокуXZ.Обновление = Истина;
    
КонецПроцедуры 

&НаКлиенте
Процедура ОбновитьДиаграммуСверхуXYНаКлиенте()
    
    // Очищаем диаграмму перед построением
    ДиаграммаСверхуXY.Очистить();
    ДиаграммаСверхуXY.АвтоТранспонирование = Ложь;
    ДиаграммаСверхуXY.Обновление = Ложь;
    
   
    // Создаем серии и запоминаем их
    Серия = ДиаграммаСверхуXY.Серии.Добавить("XY");
    
    // Добавляем точки
    Для Каждого СтрокаТЗ Из Объект.Выборка Цикл
        Точка = ДиаграммаСверхуXY.УстановитьТочку(СтрокаТЗ.X);
        Серия = Серия;
        ДиаграммаСверхуXY.УстановитьЗначение(Точка, Серия, СтрокаТЗ.Y);
    КонецЦикла;
  
   
    // Включаем обновление и автотранспонирование
    ДиаграммаСверхуXY.АвтоТранспонирование = Истина;
    ДиаграммаСверхуXY.Обновление = Истина;
    
КонецПроцедуры 

&НаКлиенте
Процедура ОбновитьДиаграммуСбокуYZНаКлиенте()
    
    // Очищаем диаграмму перед построением
    ДиаграммаСбокуYZ.Очистить();
    ДиаграммаСбокуYZ.АвтоТранспонирование = Ложь;
    ДиаграммаСбокуYZ.Обновление = Ложь;
    
   
    // Создаем серии и запоминаем их
    Серия = ДиаграммаСбокуYZ.Серии.Добавить("YZ");
    
    // Добавляем точки
    Для Каждого СтрокаТЗ Из Объект.Выборка Цикл
        Точка = ДиаграммаСбокуYZ.УстановитьТочку(СтрокаТЗ.Y);
        Серия = Серия;
        ДиаграммаСбокуYZ.УстановитьЗначение(Точка, Серия, СтрокаТЗ.Z);
    КонецЦикла;
  
   
    // Включаем обновление и автотранспонирование
    ДиаграммаСбокуYZ.АвтоТранспонирование = Истина;
    ДиаграммаСбокуYZ.Обновление = Истина;
    
КонецПроцедуры 

&НаКлиенте
Процедура ОбновитьДиаграммуЭлементовНаКлиенте()
    
    // Очищаем диаграмму перед построением
    ДиаграммаЭлементы.Очистить();
    ДиаграммаЭлементы.АвтоТранспонирование = Ложь;
    ДиаграммаЭлементы.Обновление = Ложь;
    
    // Создаем серии для каждого уникального Y
    УникальныеY = Новый Соответствие;
    Для Каждого СтрокаТЗ Из Объект.Выборка Цикл
        УникальныеY[СтрокаТЗ.Y] = Истина;
    КонецЦикла;
    
    // Создаем серии и запоминаем их
    Серии = Новый Соответствие;
    Для Каждого КлючИЗначение Из УникальныеY Цикл
        YЗначение = КлючИЗначение.Ключ;
        Серии[YЗначение] = ДиаграммаЭлементы.Серии.Добавить("Y=" + YЗначение);
    КонецЦикла;
    
    // Добавляем точки
    Для Каждого СтрокаТЗ Из Объект.Выборка Цикл
        Точка = ДиаграммаЭлементы.УстановитьТочку(СтрокаТЗ.X);
        Серия = Серии[СтрокаТЗ.Y];
        ДиаграммаЭлементы.УстановитьЗначение(Точка, Серия, СтрокаТЗ.Z);
    КонецЦикла;
  
   
    // Включаем обновление и автотранспонирование
    ДиаграммаЭлементы.АвтоТранспонирование = Истина;
    ДиаграммаЭлементы.Обновление = Истина;
    
КонецПроцедуры 
