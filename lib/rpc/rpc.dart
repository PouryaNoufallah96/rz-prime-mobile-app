import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reown_appkit/reown_appkit.dart';
import 'package:web3dart/crypto.dart';

class AppRpc {
  Future<void> get() async {
    const rpc = 'https://sepolia.drpc.org';
    final web3 = Web3Client(rpc, http.Client());

    final contract = DeployedContract(
        ContractAbi.fromJson(jsonEncode(abi), 'TokenForwardSale'),
        EthereumAddress.fromHex('0xB0D6B2805C09A37c762c3599fA932DC5Dc0D65c3'));

    final contractFunction = contract.function('getOrder').encodeCall([
      EthereumAddress.fromHex('0x55304995141dc954d7cb8bA77302b16fe7d629A4'),
      'acd3f7224ea04fbf8abec2dd4eb2521d',
    ]);

    final hex = bytesToHex(contractFunction, include0x: true);

    // final res = await web3.call(
    //   contract: contract,
    //   function: contractFunction,
    //   params: [
    //     EthereumAddress.fro
    // mHex('0x55304995141dc954d7cb8bA77302b16fe7d629A4'),
    //     'acd3f7224ea04fbf8abec2dd4eb2521d',
    //   ],
    // );
  }

  static final List<Map<String, Object>> abi = [
    {
      'inputs': [
        {'internalType': 'address', 'name': '_operator', 'type': 'address'},
        {'internalType': 'address', 'name': '_owner', 'type': 'address'},
        {'internalType': 'address', 'name': '_vault', 'type': 'address'},
        {'internalType': 'address', 'name': '_usdt', 'type': 'address'}
      ],
      'stateMutability': 'nonpayable',
      'type': 'constructor'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'owner', 'type': 'address'}
      ],
      'name': 'OwnableInvalidOwner',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'account', 'type': 'address'}
      ],
      'name': 'OwnableUnauthorizedAccount',
      'type': 'error'
    },
    {'inputs': [], 'name': 'ReentrancyGuardReentrantCall', 'type': 'error'},
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'user',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'string',
          'name': 'orderId',
          'type': 'string'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'payAmount',
          'type': 'uint256'
        }
      ],
      'name': 'OrderExecuted',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'user',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'string',
          'name': 'orderId',
          'type': 'string'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'tokenAmount',
          'type': 'uint256'
        }
      ],
      'name': 'OrderRegistered',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'previousOwner',
          'type': 'address'
        },
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'newOwner',
          'type': 'address'
        }
      ],
      'name': 'OwnershipTransferred',
      'type': 'event'
    },
    {
      'inputs': [
        {'internalType': 'string', 'name': 'orderId', 'type': 'string'}
      ],
      'name': 'executeOrder',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'user', 'type': 'address'},
        {'internalType': 'string', 'name': 'orderId', 'type': 'string'}
      ],
      'name': 'getOrder',
      'outputs': [
        {
          'components': [
            {'internalType': 'address', 'name': 'buyToken', 'type': 'address'},
            {
              'internalType': 'uint256',
              'name': 'tokenAmount',
              'type': 'uint256'
            },
            {'internalType': 'uint256', 'name': 'payAmount', 'type': 'uint256'},
            {'internalType': 'uint256', 'name': 'endAt', 'type': 'uint256'},
            {
              'internalType': 'enum TokenForwardSale.OrderStatus',
              'name': 'status',
              'type': 'uint8'
            }
          ],
          'internalType': 'struct TokenForwardSale.Order',
          'name': '',
          'type': 'tuple'
        }
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'operator',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'},
        {'internalType': 'bytes32', 'name': '', 'type': 'bytes32'}
      ],
      'name': 'orders',
      'outputs': [
        {'internalType': 'address', 'name': 'buyToken', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'tokenAmount', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'payAmount', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'endAt', 'type': 'uint256'},
        {
          'internalType': 'enum TokenForwardSale.OrderStatus',
          'name': 'status',
          'type': 'uint8'
        }
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'owner',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'user', 'type': 'address'},
        {'internalType': 'string', 'name': 'orderId', 'type': 'string'},
        {'internalType': 'address', 'name': 'buyToken', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'tokenAmount', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'payAmount', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'endAt', 'type': 'uint256'}
      ],
      'name': 'registerUserOrder',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'renounceOwnership',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': '_operator', 'type': 'address'}
      ],
      'name': 'setOperator',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': '_vault', 'type': 'address'}
      ],
      'name': 'setVault',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'newOwner', 'type': 'address'}
      ],
      'name': 'transferOwnership',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'vault',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'token', 'type': 'address'},
        {'internalType': 'address', 'name': 'to', 'type': 'address'}
      ],
      'name': 'withdrawTokens',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    }
  ];
}
