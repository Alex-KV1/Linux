#!/bin/bash

param=$1

if [[ $param = '' ]]; then
	echo "Не указан параметр"

elif [[ ! $param =~ ^[0-9]+$ && -n $param ]]; then
	echo "Введен параметр: $param"
else
	echo "Введен неверный параметр"
fi