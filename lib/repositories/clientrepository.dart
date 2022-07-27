import 'package:appsalao/models/client.dart';

class ClientRepository {
  static List<Client> listaClient = [
    Client(name: 'Felipe Rabelo', workTask: 'corte', date: '15:00'),
    Client(name: 'Daniele Zauro', workTask: 'Progressiva', date: '16:00'),
    Client(name: 'Daiane Zauro', workTask: 'Luzes', date: '17:00'),
    Client(name: 'Alessandra Zauro', workTask: 'Carbox', date: '18:00'),
    Client(name: 'Fulana de tal', workTask: 'Carbox', date: '18:00'),
    Client(name: 'Sueli Zauro', workTask: 'Hidratação', date: '18:30'),
    Client(name: 'Mirta Aparecida', workTask: 'extensão', date: '19:00')
  ];
}
