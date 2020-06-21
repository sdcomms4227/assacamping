### 작업중인 프로젝트에 추가하기
```
git remote add origin https://github.com/sdcomms4227/assacamping.git
git push -u origin master
```

### 프로젝트 복제하기
```
git clone https://github.com/sdcomms4227/assacamping.git
```

### 새로운 이름으로 프로젝트 복제하기

```
git clone https://github.com/sdcomms4227/assacamping.git 폴더명
```

### 브랜치 생성
```
git branch 브랜치명
```
각자 본인의 브랜치에서 계속 작업하면 됩니다.

### PUSH 오류 발생시

1. git push orign master 시 다음과 같은 오류가 발생할 경우
```
[rejected]
error: failed to push some refs to ...
```

2. push 하기전 pull을 해서 프로젝트를 병합해주어야 한다.
```
git pull origin master
```

3. local 과 remote 사이의 연관성이 없을 경우 다음과 같은 오류가 발생한다.
```
fatal :refusing to merge unrelated histories
```

4. --allow-unrelated-histories 옵션을 사용하여 연관성이 없더라도 pull이 가능하도록 허용해준다.
```
git pull origin master --allow-unrelated-histories
```
