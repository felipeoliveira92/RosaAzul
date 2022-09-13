class WorkTask {
  DateTime? horario;
  String? nomeCliente;
  String? preco;
  String? descricao;
  String? id;
  //colocar referencia de client

  WorkTask(
      {this.horario, this.nomeCliente, this.preco, this.descricao, this.id});

  WorkTask.fromJson(Map<String, dynamic> json) {
    horario = json['horario'];
    nomeCliente = json['nomeCliente'];
    preco = json['preco'];
    descricao = json['descricao'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['horario'] = this.horario;
    data['nomeCliente'] = this.nomeCliente;
    data['preco'] = this.preco;
    data['descricao'] = this.descricao;
    data['id'] = this.id;
    return data;
  }
}