#! /bin/bash

#But du script : créer ou mettre à jours une stack aws

echo " 1 - Créer une stack sur aws"
echo " 2 - Update la stack"

echo " Renseigner le n° de l'action demandée : "

read var

if [$var = "1"]; then
    echo ""
    echo "Nom de la stack : "
    read stackname
    echo ""
    echo "Quel fichier json ou yaml? "
    read file
    echo ""
    echo "nom de la keypair : "
    read sshkey
    echo ""
    echo "lancement de la creation de la stack"
    aws cloudformation create-stack  --stack-name $stackname \
    --template-body file://$file \ #fichier.json ou .yaml
    --parameters  ParameterKey=KeyPairName,ParameterValue=$sshkey ParameterKey=InstanceType,ParameterValue=t2.micro
elif [$var = "2"]
then
    echo ""
    echo "Nom de la stack : "
    read stackname
    echo ""
    echo "Quel fichier json? "
    read file
    echo ""
    echo "nom de la keypair : "
    read sshkey
    echo ""
    aws cloudformation update-stack --stack-name $stackname \
    --template-body file://$file \
    --parameters  ParameterKey=KeyPairName,ParameterValue=$sshkey ParameterKey=InstanceType,ParameterValue=t2.micro
else
    echo "Merci de choisir 1 ou 2"
