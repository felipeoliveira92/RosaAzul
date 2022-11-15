const String createTableUsers = '''
    CREATE TABLE USER(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      username TEXT,
      password TEXT,
      type INT
    );
  ''';

const String createTableClients = '''
    CREATE TABLE Clients(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      cellphone TEXT
    );
  ''';

const String createTableWorks = '''
    CREATE TABLE Works(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      dateInitial TEXT DEFAULT CURRENT_TIMESTAMP,
      dateEnd TEXT DEFAULT CURRENT_TIMESTAMP,
      idClient INT,
      idService INT,
      idUser INT,
      price REAL,
      observation TEXT
    );
  ''';

const String createTableTypeServices = '''
    CREATE TABLE TypeServices(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      description TEXT,
      price REAL
    );
  ''';
