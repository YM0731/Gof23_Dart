void main() {
  Handler hadlerA = ConcreteHandlerA();
  Handler hadlerB = ConcreteHandlerB();

  hadlerA.setNext(hadlerB);
  hadlerA.handlerRequest('B');
}

abstract class Handler {
  Handler? next;

  void setNext(Handler next) {
    this.next = next;
  }

  void handlerRequest(String request);
}

class ConcreteHandlerA extends Handler {
  @override
  void handlerRequest(String request) {
    if (request == "A") {
      print('ConcretehandlerAがリクエストを処理しました。');
    } else if (next != null) {
      next?.handlerRequest(request);
    }
  }
}

class ConcreteHandlerB extends Handler {
  @override
  void handlerRequest(String request) {
    if (request == "B") {
      print('ConcretehandlerBがリクエストを処理しました。');
    } else if (next != null) {
      next?.handlerRequest(request);
    }
  }
}
