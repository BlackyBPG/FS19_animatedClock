# FS19_animatedClock
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/mod_animatedClock.png "Animated Clock Logo")
 
 Das Script animierte Uhr (animatedClock) ist ein kleines nichtsynchronisertes Addon für Kartenbauer.
Es kann nicht ohne direkten Einbau in eine Karte genutzt werden.

Dieses Script sorgt dafür das eingebaute Uhren welche auf diesem Script basieren entweder die InGame Uhrzeit oder aber die Realzeit darstellen.

Dem Archiv liegen 3 Digital sowie 3 Analoge Uhren bei welche genutzt werden können.
Selbstverständlich kann auch jeder seine eigenen Uhren oder Anzeigen verwenden.

------------

### Karteneinbau und Beschreibung

**ModDesc.xml Eintragungen**
Es wird nur ein Eintrag in der ModDesc.xml benötigt, und zwar wird in der <extraSourceFiles> Sektion folgender Eintrag hinzugefügt:

    <sourceFile filename="{DeinScriptPfad}/animatedClock.lua" />

**UserAttribute und Erklärung**

- onCreate
- - Standardwert: NA
- - Typ: ScriptCallback
- - modOnCreate.animatedClock um das Objekt an die animierteUhren-Funktionen zu binden

- digits
- - Standardwert: NA
- - Typ: String
- - Indexzuordnung zu den Digitalzahlen welche die Uhrzeit darstellen

- hourPointer
- - Standardwert: NA
- - Typ: String
- - Indexzuordnung zum Stundenzeiger einer Analoguhr

- minutePointer
- - Standardwert: NA
- - Typ: String
- - Indexzuordnung zum Minutenzeiger einer Analoguhr

- secondPointer
- - Standardwert: NA
- - Typ: String
- - Indexzuordnung zum Sekundenzeiger einer Analoguhr
- - Optional: ein Sekundenzeiger muß nicht genutzt werden

- pointerSteps
- - Standardwert: FALSE
- - Typ: Boolean
- - Betrifft nur Analoge Uhren
- - wenn TRUE dann werden die Sekunden und Minuten in Schritten (Klicks) angezeigt, wenn FALSE dann fließend fortlaufend

- realTime
- - Standardwert: FALSE
- - Typ: Boolean
- - wenn TRUE dann wird die Echtzeit bzw Computerzeit angezeigt, wenn FALSE wird die InGame Uhrzeit angezeigt


**Hinweise**
Bei Digitalanzeigen gibt es NUR die Möglichkeit 4 oder 6 Zahlen darzustellen, also entweder Stunden und Minuten oder Stunden, Minuten und Sekunden.


------------

![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_01.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_02.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_03.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_04.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_05.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_06.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_07.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_08.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_09.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_10.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_11.png "AnimatedClock")
![AnimatedClock Ingame](https://github.com/BlackyBPG/FS19_animatedClock/blob/master/animatedClock_12.png "AnimatedClock")

------------

------------

#### CHANGELOG:

- ##### Version 1.9.0.1 (04.02.2020)
- - add realtime functionality
- - add digitalDisplay functionality
- - first release for FS19

