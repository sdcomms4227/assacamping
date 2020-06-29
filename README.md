## 현재 로그 상태 보기
```
git log --oneline --branches --graph
```

---

## 프로젝트 추가, 복제
### 현재 프로젝트에 원격저장소 추가하기
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

---

## 브랜치

각자 브랜치를 생성해서 작업합니다.

### 브랜치 생성하기
```
git branch 브랜치명
```

### 해당 브랜치에서 작업하기
```
git checkout 브랜치명
```

---

## Push 오류 발생시
1. git push orign master 시 다음과 같은 오류가 발생할 경우
```
[rejected]
error: failed to push some refs to ...
```
2. push 하기전 pull을 해서 프로젝트를 병합해주어야 합니다.
```
git pull origin master
```
3. local 과 remote 사이의 연관성이 없을 경우 다음과 같은 오류가 발생합니다.
```
fatal :refusing to merge unrelated histories
```
4. --allow-unrelated-histories 옵션을 사용하여 연관성이 없더라도 pull이 가능하도록 허용해야 합니다.
```
git pull origin master --allow-unrelated-histories
```
