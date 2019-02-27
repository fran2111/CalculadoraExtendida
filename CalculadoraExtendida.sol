pragma solidity ^0.5.2; 

contract Calculadora {
    //Atributos
    struct MemoriaCliente
    {
        int256 memoriaCliente;
        //otros posibles datos:id_cliente,nombre_cliente
    }
    mapping (address => MemoriaCliente) _memorias_clientes;
    //lista con contador:pendiente revisar
    //Constructor
    function Constructor() public
    {
        _memorias_clientes[msg.sender].memoriaCliente=0;
    }
    //Funciones
    function suma(int256 a, int256 b) public pure returns (int256)
    {
        return a + b;
    }
    function sumaMemoria(int256 a) public view returns (int256)
    {
        return a + _memorias_clientes[msg.sender].memoriaCliente;
    }
    function resta(int256 a, int256 b) public pure returns (int256)
    {
        return a - b;
    }
    function restaMemoria(int256 a) public view returns (int256)
    {
        return a - _memorias_clientes[msg.sender].memoriaCliente;
    }
    function almacenaMemoria(int256 resultado) public returns (int256)
    {
        _memorias_clientes[msg.sender].memoriaCliente= resultado;
        return resultado;
    }
    function obtenerMemoria() public view returns (int256)
    {
        return _memorias_clientes[msg.sender].memoriaCliente;
    }
    function borrarMemoria() public
    {
        _memorias_clientes[msg.sender].memoriaCliente = 0;
    }
    //Funciones extendidas
    function multiplica(int256 a, int256 b) public pure returns (int256)
    {
            return a * b;
    }
    function multiplicaMemoria(int256 a) public  view  returns (int256)
    {
            return a * _memorias_clientes[msg.sender].memoriaCliente;
    }
    function divide(int256 a, int256 b) public pure returns (int256)
    {
            require (b!=0,"denominador es cero");
            return a/b ;
    }
    //DivisionPorCero indicando el identificador de usuario y el valor de a.
    event DivisionPorCero(address,int256);
    function divideMemoria(int256 a) public  returns (int256)
    {       
            if(_memorias_clientes[msg.sender].memoriaCliente <= 0) {
                emit DivisionPorCero(msg.sender,_memorias_clientes[msg.sender].memoriaCliente);
            } else {
                return a /_memorias_clientes[msg.sender].memoriaCliente;
            }
    }
    function factorial(int256 a) public pure returns (int256)
    {
        require(a>=0,"Es negativo");
        if (a == 0) {
            return 1;
        }else {
            assert(a > 0);
            return a * factorial (a-1);
        }
    }
}