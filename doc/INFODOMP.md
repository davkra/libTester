# Info dump

Fehler: Hauptklasse MyNativeClass konnte nicht gefunden oder geladen werden
Ursache: java.lang.NoClassDefFoundError: at/libtester/MyNativeClass (wrong name: MyNativeClass)

You must run java from the directory containing the at folder. Navigate to the parent directory of at, then run:

java at.libtester.MyNativeClass

---

/usr/lib/jvm/java-17-openjdk-amd64/include

Always run from java/ dir!!!
